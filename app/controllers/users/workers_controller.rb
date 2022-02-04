module Users
  class WorkersController < Users::Base
    before_action :set_worker, except: %i[index new create update_images]

    def index
      @workers = current_business.workers
    end

    def new
      @worker = current_business.workers.new(
        # テスト用デフォルト値 ==========================
        name:                           'サンプル作業員',
        name_kana:                      'サンプルサギョウイン',
        country:                        '日本',
        my_address:                     '東京都港区1-1',
        my_phone_number:                '01234567898',
        family_address:                 '埼玉県三郷市1-1',
        family_phone_number:            '09876543210',
        birth_day_on:                   '2000-01-28',
        abo_blood_type:                 0,
        rh_blood_type:                  0,
        job_type:                       0,
        hiring_on:                      '2022-01-28',
        experience_term_before_hiring:  10,
        blank_term:                     3,
        carrier_up_id:                  '1'
        # ============================================
      )
    end

    def create
      @worker = current_business.workers.build(worker_params)
      if @worker.save
        redirect_to users_worker_path(@worker)
      else
        render :new
      end
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end


    private

    def set_worker
      @worker = current_business.workers.find(params[:id])
    end

    def worker_params
      params.require(:worker).permit(:name, :name_kana,
        :country, :my_address, :my_phone_number, :family_address,
        :family_phone_number, :birth_day_on, :abo_blood_type,
        :rh_blood_type, :job_type, :hiring_on, :experience_term_before_hiring,
        :blank_term, :carrier_up_id, { images: [] })
    end
  end
end
