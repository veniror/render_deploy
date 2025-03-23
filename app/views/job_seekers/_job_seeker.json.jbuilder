json.extract! job_seeker, :id, :full_name, :email, :date_of_birth, :mobile, :address, :created_at, :updated_at
json.url job_seeker_url(job_seeker, format: :json)
