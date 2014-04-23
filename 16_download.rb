file_id = '0B7Hu6LPIcm1161pGUXhDb1J2saTFk'

result = client.execute(
  api_method: drive.files.get,
  parameters: { fileId: file_id }
)

file = client.execute(uri: result.data.downloadUrl)

File.open('pug-barks.mp3','w') do |f|
  f.write file.body
end


permission = {
  role: 'writer',
  type: 'user',
  value: 'mixmaster91552@gmail.com'
}

file_id = '0B7Hu6LPIchDb1J2sm1161pGUXaTFk'

result = client.execute(
    api_method: drive.permissions.insert,
    body_object: permission,
    parameters: { 'fileId' => file_id }
)