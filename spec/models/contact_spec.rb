require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe 'バリデーションのテスト' do
    subject { contact.valid? }

    let(:contact) { Contact.new(name: name, email: email, title: title, message: message) }

    context '全ての値が適切な場合' do
      let(:name) { 'テストユーザー' }
      let(:email) { 'test@example.com' }
      let(:title) { 'お問い合わせタイトル' }
      let(:message) { 'お問い合わせ内容' }

      it '有効であること' do
        expect(contact).to be_valid
      end
    end

    context '名前が空の場合' do
      let(:name) { '' }
      let(:email) { 'test@example.com' }
      let(:title) { 'お問い合わせタイトル' }
      let(:message) { 'お問い合わせ内容' }

      it '無効であること' do
        expect(contact).to be_invalid
        expect(contact.errors[:name]).to include("を入力してください")
      end
    end

    context 'メールアドレスが空の場合' do
      let(:name) { 'テストユーザー' }
      let(:email) { '' }
      let(:title) { 'お問い合わせタイトル' }
      let(:message) { 'お問い合わせ内容' }

      it '無効であること' do
        expect(contact).to be_invalid
        expect(contact.errors[:email]).to include("を入力してください")
      end
    end

    context 'タイトルが空の場合' do
      let(:name) { 'テストユーザー' }
      let(:email) { 'test@example.com' }
      let(:title) { '' }
      let(:message) { 'お問い合わせ内容' }

      it '無効であること' do
        expect(contact).to be_invalid
        expect(contact.errors[:title]).to include("を入力してください")
      end
    end

    context 'メッセージが空の場合' do
      let(:name) { 'テストユーザー' }
      let(:email) { 'test@example.com' }
      let(:title) { 'お問い合わせタイトル' }
      let(:message) { '' }

      it '無効であること' do
        expect(contact).to be_invalid
        expect(contact.errors[:message]).to include("を入力してください")
      end
    end
  end
end
