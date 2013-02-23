require 'spec_helper'

describe Post do

  let(:user) { FactoryGirl.create :user }
  before { @post = user.posts.build subject: 'no title', body: 'Lorem ipsum bra bra' }

  subject { @post }

  it { should respond_to :body }
  it { should respond_to :writer }
  it { should respond_to :user }
  it { should be_valid }

  describe "when user_id is not present" do
    before { @post.user_id = nil }
    it { should_not be_valid }
  end


end