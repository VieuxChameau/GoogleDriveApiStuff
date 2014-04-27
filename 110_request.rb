state = MultiJson.decode(params[:state])

if state['action'] == 'open'
  result = client.execute(
    api_method: drive.files.get,
    parameters: { fileId: state['ids'][0] }
  )
end


state = MultiJson.decode(params[:state])

if state['action'] == 'create'
  result = client.execute(
    api_method: drive.files.get,
    parameters: {
      fileId: state['folderId']
      }
  )
end