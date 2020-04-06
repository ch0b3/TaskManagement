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
      where(:name, :email, :password) do
        [
          ['name', 'email@gmail.com', 'password']
        ]
      end
      with_them do
        it { is_expected.to be_valid }
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
      context "password is less than 7 characters" do
        where(:name, :email, :password) do
          [
            ['name','email@gmail.com','a']
          ]
        end
        with_them do
          it { is_expected.to be_invalid }
        end
      end
      context "name or email has too many characters" do
        where(:name, :email, :password) do
          [
            ['123456789123456789123456789123456789', 'email@gmail.com', 'password'],
            ['name', '123456789123456789123456789123456789123456789', 'password']
          ]
        end
        with_them do
          it { is_expected.to be_invalid }
        end
      end
    end
  end
end
