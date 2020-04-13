require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validate' do
    subject { FactoryBot.build(:user, params) }

    let(:params) do
      {
        name: name,
        email: email,
        password: password
      }
    end

    context 'with valid params' do
      where(:name, :email, :password) do
        [
          [SecureRandom.alphanumeric(30), SecureRandom.alphanumeric(40), SecureRandom.alphanumeric(8)]
        ]
      end
      with_them do
        it { is_expected.to be_valid }
      end
    end

    context 'with invalid params' do
      context 'with empty params' do
        where(:name, :email, :password) do
          [
            ['', 'email@gmail.com', 'password'],
            ['name', '', 'password'],
            ['name', 'email@gmail.com', '']
          ]
        end
        with_them do
          it { is_expected.to be_invalid }
        end
      end

      context 'when password is less than 8 characters' do
        where(:name, :email, :password) do
          [
            ['name', 'email@gmail.com', SecureRandom.alphanumeric(7)]
          ]
        end
        with_them do
          it { is_expected.to be_invalid }
        end
      end

      context 'when name has 31 characters' do
        where(:name, :email, :password) do
          [
            [SecureRandom.alphanumeric(31), 'email@gmail.com', 'password']
          ]
        end
        with_them do
          it { is_expected.to be_invalid }
        end
      end

      context 'when email has 41 characters' do
        where(:name, :email, :password) do
          [
            ['name', SecureRandom.alphanumeric(41), 'password']
          ]
        end
        with_them do
          it { is_expected.to be_invalid }
        end
      end

      context 'when email already exist' do
        let(:name) { 'name' }
        let(:email) { 'email@gmail.com' }
        let(:password) { 'password' }

        before do
          FactoryBot.create(:user, email: email)
        end

        it { is_expected.to be_invalid }
      end
    end
  end
end
