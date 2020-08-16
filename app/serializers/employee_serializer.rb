class EmployeeSerializer < ActiveModel::Serializer
  attributes :id,
            :name,
            :last_name,
            :cellphone,
            :identification,
            :email,
            :job_position,
            :age,
            :initial_date
end