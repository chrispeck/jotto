
require 'secret_word'

def rand_word(length=10)
  (Array.new(length) { Random.rand('a'.ord .. 'z'.ord).chr }).join
end

describe SecretWord do
  subject { SecretWord.new }

  it "should initialize to a nil word." do
    subject.word.should eq(nil)
  end

  describe '#word' do
    it "should be settable." do
      subject.word = 'xyzzy'
      subject.word.should eq('xyzzy')
    end
  end

  describe '#is_word?' do
    it "should test its argument against the value of #word." do
      word = rand_word
      subject.word = word

      # This one should be false, unless rand_word returns the same thing
      # twice. Which could happen.
      w2 = rand_word
      subject.is_word?(w2).should eq(word == w2)
      subject.is_word?(word).should eq(true)
    end
  end

  describe '#get_matches' do
    it "should return the number of matching characters between the input and the secret word." do
      word = rand_word
      subject.word = word

      (0..word.length).each do |i|
        to_match = word[0..i]
        subject.get_matches(to_match).should eq(i + 1)
      end
    end

    it "should not care about the order of the letters in the input." do
      word = rand_word
      subject.word = word

      (0..word.length).each do |i|
        to_match = word[0..i].chars.to_a.shuffle.join
        subject.get_matches(to_match).should eq(i + 1)
      end
    end
  end

  describe '#to_s' do
    it "should delegate to #word." do
      3.times do
        subject.word = rand_word
        subject.to_s.should eq(subject.word)
      end
    end
  end

  describe '#length' do
    it "should delegate to #word." do
      3.times do
        subject.word = rand_word(Random.rand_int(25))
        subject.length.should eq(subject.word.length)
      end
    end
  end
end

