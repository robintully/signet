class WordGetter
  def self.random_word
    path = File.join(Rails.root, "words")
    word = File.readlines(path).shuffle.first.chomp
    if Envelope.find_by_slug(word)
      word = File.readlines(path).shuffle.first.chomp
    else
      word
    end
  end
end