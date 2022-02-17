class News < ApplicationRecord

  validate :unable_to_be_published

  enum status: {
    draft: 0,  # 下書きの状態 default
    published: 1 # 公開の状態
  }

  private

  def unable_to_be_published
    if (title == nil || context == nil || delivered_at == nil)
      if status == "published"
        errors.add(:published, "全ての項目を入力しないと公開できません")
      end
    end
  end

end
