channel = {
  id: '123',
  type: 'web_hook',
  address: 'https://example.com/notifications'
}

file_id = '0B7Hu6LPIcm11sd2365321b1J2saTFk'

# Register to get notification
result = client.execute(
  api_method: drive.files.watch,
  body_object: channel,
  parameters: { 
    fileId: file_id
    }
)


# Stop watching notifications
channel_id = 123
file_id = '0B7Hu6LPIcm11sd2365321b1J2saTFk'

result = client.execute(
  api_method: drive.channels.stop,
  parameters: { 
    id: channel_id,
    resourceId: file_id
    }
)