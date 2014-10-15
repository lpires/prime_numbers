require 'spec_helper'

describe NPrime do
  it 'should multi the 1st 10 app numbers' do
    result = NPrime.multi 10

    expect(result[2]).to eql([4, 6, 10, 14, 22, 26, 34, 38, 46, 58])
    expect(result[3]).to eql([6, 9, 15, 21, 33, 39, 51, 57, 69, 87])
    expect(result[5]).to eql([10, 15, 25, 35, 55, 65, 85, 95, 115, 145])
    expect(result[7]).to eql([14, 21, 35, 49, 77, 91, 119, 133, 161, 203])
    expect(result[11]).to eql([22, 33, 55, 77, 121, 143, 187, 209, 253, 319])
    expect(result[13]).to eql([26, 39, 65, 91, 143, 169, 221, 247, 299, 377])
    expect(result[17]).to eql([34, 51, 85, 119, 187, 221, 289, 323, 391, 493])
    expect(result[23]).to eql([46, 69, 115, 161, 253, 299, 391, 437, 529, 667])
    expect(result[29]).to eql([58, 87, 145, 203, 319, 377, 493, 551, 667, 841])
  end
end