require 'rspec'
require 'level'

describe Level do
  describe 'level' do
    it 'has a map' do
      level = Level.new()
      print level.map
      expect(level.map).to_not eq(nil)
    end
    # it 'has a paddle' do
    #   level = Level.new([])
    #   expect(level.paddle).to_not eq(nil)
    # end
  end
end
