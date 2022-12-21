class UrlParserUtil
  def parse(string)
    string.split(';').reject(&:empty?)
  end
end
