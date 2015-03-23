class JobTable < TableCloth::Base
  column :name do |job|
    link_to job.name, job_path(job)
  end
  column :complete
end
