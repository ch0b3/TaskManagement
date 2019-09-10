require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'タスク検索機能' do

    let(:status_done) { FactoryBot.create(:status_done) }
    let(:status_underway){ FactoryBot.create(:status_underway) }
    let(:task1) { FactoryBot.create(:task, name: 'first task', status: status_done.id) }
    let(:task2) { FactoryBot.create(:task, name: 'second task', status: status_underway.id) }
    let(:task3) { FactoryBot.create(:task, name: 'third', status: status_done.id) }

    context '名前とステータスで検索' do
      it '一致する名前とステータスを持つタスクを返すこと' do
        expect(Task.search('task',1)).to include(task1)
        expect(Task.search('task',1)).to_not include(task2)
        expect(Task.search('task',1)).to include(task1)
        expect(Task.search('task',1)).to_not include(task3)
        expect(Task.search('fourth',4)).to be_empty
      end
    end

    context '名前で検索' do
      it '一致する名前のタスクを返すこと' do
        expect(Task.search('first',nil)).to include(task1)
        expect(Task.search('first',nil)).to_not include(task2,task3)
        expect(Task.search('task',nil)).to include(task1,task2)
        expect(Task.search('task',nil)).to_not include(task3)
        expect(Task.search('fourth',nil)).to be_empty
      end
    end

    context 'ステータスで検索' do
      it '一致するステータスのタスクを返すこと' do
        expect(Task.search(nil,1)).to include(task1)
        expect(Task.search(nil,1)).to_not include(task2)
        expect(Task.search(nil,4)).to be_empty
      end
    end

    context 'パラメータが送られない場合' do
      it '何も返さないこと' do
        expect(Task.search(nil,nil)).to be_empty
      end
    end

  end
end
