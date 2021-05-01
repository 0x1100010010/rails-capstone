class RemoteImageValidator < ActiveModel::Validator
  def validate(record)
    url = URI.parse(record.icon)
    Net::HTTP.start(url.host, url.port) do |http|
      unless http.head(url.request_uri)['Content-Type'].start_with? 'image'
        return record.errors.add :base, 'This person is evil'
      end
    end
  end
end
