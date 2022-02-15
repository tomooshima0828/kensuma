class News < ApplicationRecord

  enum status: {
    draft: 0,  # 下書きの状態 default
    publish: 1 # 公開の状態
  }

end
