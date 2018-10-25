class ApiQueryService
  require 'net/http'
  BASE_URL = 'https://api.chucknorris.io/jokes'
  WORD_QUERY = '/search'
  RANDOM_QUERY = '/random'

  def initialize(type, value)

    @type = type
    @value = value
    @facts = []
    case type
    when :word
      @host = BASE_URL + WORD_QUERY
      @params = {query: value}
    when :category
      @host = BASE_URL + RANDOM_QUERY
      @params = {category: value}
    when :random
      @host = BASE_URL + RANDOM_QUERY
      @params = nil
    else
      raise ArgumentError.new 'Unknown query type'
    end
  end

  def execute_query
    response = perform_get_request.response
    parse_and_save_facts(response)
  end

  def create_search
    Search.new(search_type: @type, value: @value, facts: @facts)
  end

  private

  def perform_get_request
    uri = URI.parse(@host)
    uri.query = URI.encode_www_form(@params) if @params
    Net::HTTP.get_response(uri)
  end

  def parse_and_save_facts(response)
    json_response = JSON.parse(response.body)
    multiple_values = json_response['result']
    multiple_values ? parse_multiple_values(multiple_values) : parse_single_value(json_response)
  end

  def parse_multiple_values(results)
    results.each do |result|
      parse_single_value(result)
    end
  end

  def parse_single_value(result)
    @facts << Fact.create(ref_id: result['id'], value: result['value'])
  end
end