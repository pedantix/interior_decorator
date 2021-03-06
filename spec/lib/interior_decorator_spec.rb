class ActionView; module Base; end; end

require 'interior_decorator'
require 'fixtures/user'
require 'fixtures/user_decorator'

describe InteriorDecorator do

  let(:item) { User.new }
  subject { UserDecorator.new(item) }

  it 'returns a decorated version of an object' do
    expect(subject).to be_instance_of UserDecorator
  end

  it 'can call methods on the model' do
    expect(subject.full_name).to eq 'Kevin Spacey'
  end

  it 'returns an overloaded method from the decorator' do
    expect(subject.favorite_food).to eq 'pie'
  end

  it 'sends missing methods to the model' do
    expect(subject.likes_dogs).to be_true
  end

  it 'can explicitly call model methods' do
    expect(subject.likes_to_bake).to eq 'cake'
  end

end
