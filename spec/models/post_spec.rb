require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it 'requires a title' do
      post = Post.new(title: nil)
      post.valid?
      expect(post.errors[:title]).to include("can't be blank")
    end

    it 'validates the maximum length of title' do
      post = Post.new(title: 'a' * 251)
      post.valid?
      expect(post.errors[:title]).to include('is too long (maximum is 250 characters)')
    end

    it 'validates numericality of comments_counter' do
      post = Post.new(comments_counter: 'invalid')
      post.valid?
      expect(post.errors[:comments_counter]).to include('is not a number')
    end

    it 'validates comments_counter is greater than or equal to 0' do
      post = Post.new(comments_counter: -1)
      post.valid?
      expect(post.errors[:comments_counter]).to include('must be greater than or equal to 0')
    end

    it 'validates numericality of likes_counter' do
      post = Post.new(likes_counter: 'invalid')
      post.valid?
      expect(post.errors[:likes_counter]).to include('is not a number')
    end

    it 'validates likes_counter is greater than or equal to 0' do
      post = Post.new(likes_counter: -1)
      post.valid?
      expect(post.errors[:likes_counter]).to include('must be greater than or equal to 0')
    end
  end
end
