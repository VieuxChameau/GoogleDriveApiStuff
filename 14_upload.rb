file = Google::APIClient::UploadIO.new('/files/pug-snores.mp3', 'audio/mpeg')

metadata = {
  title: 'Snoring Pug',
  description: 'A pug snoring loudly.',
  mimeType: 'audio/mpeg'
}

result = client.execute(
  api_method: drive.files.insert,
  body_object: metadata,
  media: file,
  parameters: {
    'uploadType' => 'resumable'
  }
)

for n in 0..4
  if result.resumable_upload.resumable?
    sleep(1 << n)
    result = client.execute(result.resumable_upload)
  else
    break
  end
end

if result.resumable_upload.complete?
  message = 'The upload successfully completed!'
elsif result.resumable_upload.expired?
  message= 'The upload expired'
end