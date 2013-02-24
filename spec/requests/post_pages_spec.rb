require 'spec_helper'

describe "Post pages" do

  describe "index page" do
    let(:user) { FactoryGirl.create :user }
    let!(:post1) { FactoryGirl.create :post, user: user }
    let!(:post2) { FactoryGirl.create :post, user: user }

    before { visit root_path }

    describe "posts" do
      it { should have_content(post1.content) }
      it { should have_content(post2.content) }
    end
  end
end