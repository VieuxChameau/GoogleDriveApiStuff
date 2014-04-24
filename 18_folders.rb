# Create a new folder
metadata = {
  title: 'Sounds of Pugs',
  description: 'A collection of the funny sounds that Pugs make.',
  mimeType: 'application/vnd.google-apps.folder'
}

result = client.execute(
  api_method: drive.file.insert,
  body_object:metadata
)

# Moving a existing file to the folder

file_id = '0B7Hu6LPIcm11sd2365321b1J2saTFk'
folder_id = 'VGUzUzhubVRYpGUXhDb1J2saTFk'

# retrieve file
metadata = client.execute(
  api_method: drive.files.get,
  parameters: { fileId: file_id }
)

metadata.parents = [{id:folder_id}]

# move file into folder
result = client.execute(
  api_method: drive.files.update,
  body_object: metadata,
  parameters: { 'fileId' => metadata.id }
)

# Moving a existing folder under another

folder_id = 'VGUzUzhubVRYpGUXhDb1J2saTFk'
parent_folder_id = 'ZBa627sdgf4361fJ6LX52347'

# retrieve folder
metadata = client.execute(
  api_method: drive.files.get,
  parameters: { fileId: folder_id }
)

metadata.parents = [{ id:parent_folder_id }]

# move folder inside other folder
result = client.execute(
  api_method: drive.files.update,
  body_object: metadata,
  parameters: { 'fileId' => metadata.id }
)

#Listing folders

result = client.execute(
  api_method: drive.files.list,
  parameters: {q:'mimeType = "application/vnd.google-apps.folder"'}
)

# Retrieve folder by alias
application_data_folder_id = '8yE2pJoAB154qR11TLyE'

result = client.execute(
  api_method: drive.files.get,
  parameters: { fileId: "appData" }
)