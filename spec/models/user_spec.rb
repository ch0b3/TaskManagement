require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validate' do
    subject { FactoryBot.build(:user, params) }
    let(:params) {
      {
        name: name,
        email: email,
        password: password
      }
    }
    context "with valid params" do
      context "with standard params" do
        where(:name, :email, :password) do
          [
            ['name', 'email@gmail.com', 'password']
          ]
        end
        with_them do
          it { is_expected.to be_valid }
        end
      end

      context "name has 30 characters" do
        where(:name, :email, :password) do
          [
            [SecureRandom.alphanumeric(30), 'email@gmail.com', 'password']
          ]
        end
        with_them do
          it { is_expected.to be_valid }
        end
      end

      context "email has 40 characters" do
        where(:name, :email, :password) do
          [
            ['name', SecureRandom.alphanumeric(40), 'password']
          ]
        end
        with_them do
          it { is_expected.to be_valid }
        end
      end
    end

    context "with invalid params" do
      context "with empty params" do
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

      context "password is less than 8 characters" do
        where(:name, :email, :password) do
          [
            ['name','email@gmail.com','a']
          ]
        end
        with_them do
          it { is_expected.to be_invalid }
        end
      end

      context "name has 31 characters" do
        where(:name, :email, :password) do
          [
            [SecureRandom.alphanumeric(31), 'email@gmail.com', 'password'],
          ]
        end
        with_them do
          it { is_expected.to be_invalid }
        end
      end

      context "email has 41 characters" do
        where(:name, :email, :password) do
          [
            ['name', SecureRandom.alphanumeric(41), 'password']
          ]
        end
        with_them do
          it { is_expected.to be_invalid }
        end
      end

      context "email already exist" do
        let(:name) { "name" }
        let(:email) { "email@gmail.com" }
        let(:password) { "password" }

        before do
          FactoryBot.create(:user, email: email)
        end

        it { is_expected.to be_invalid }
      end
    end
  end
end
