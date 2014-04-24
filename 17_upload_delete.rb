file_id = '0B7Hu6LPIcm11sd2365321b1J2saTFk'

metadata = client.execute(
  api_method: drive.files.get,
  parameters: { fileId: file_id }
)

# Update only the metadata
metadata.title = "A Grunting Pug"
result = client.execute(
  api_method: drive.files.update,
  body_object: metadata,
  parameters:{
    'field' => metadata.id
    }
  )


# Update only the file
file = Google::APIClient::UploadIO.new('/files/pug-grunts.mp3', 'audio/mpeg')
client.execute(
  api_method: drive.files.update,
  body_object: metadata,
  media: file,
  parameters: {
    'fileId' => metadata.id,
    'uploadType' => 'resumable'
  }
)

# Custom properties

property = {
  key: 'location',
  value: 'Florida'
}

file_id = '0B7Hu6LPIcm11sd2365321b1J2saTFk'

result = client.execute(
  api_method: drive.properties.insert,
  body_object:property,
  parameters:{'fileId' => file_id}
)

result = client.execute(
  api_method: drive.properties.list,
  parameters: {
    'fileId' => file_id
    }
)

# Moving file to the trash, does not free the space in the drive
result = client.execute(
  api_method: drive.files.trash,
  parameters: {
    'fileId' => file_id
    }
)

result = client.execute(
  api_method: drive.files.untrash,
  parameters: {
    'fileId' => file_id
    }
)

# Delete cannot be rollback
result = client.execute(
  api_method: drive.files.delete,
  parameters: {
    'fileId' => file_id
    }
)