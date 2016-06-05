class WordGetter
  def self.random_word
    path = File.join(Rails.root, "words")
    File.readlines(path).shuffle.first.chomp
  end
end