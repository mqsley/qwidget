class SmsService
    att_reader :message

    def initialize(message)
        @message = message
    end

    def send_text!
        params = {number: '7204018063', message: body, key: ENV['textbelt_api']}
        resp = HTTParty.post('https://textbelt.com/text', body: params)
        JSON.parse(resp.body)
    end

    def body
        "[#{message.name} #{message.content}]"
    end

end