class Visitor < ActiveRecord::Base
  IDPROOF = { '1' => 'VoterID', '2' => 'PANCard', '3' => 'AaathorCard', '4' => 'DrivingLic', '5' => 'RationCard' }
  validates :first_name, :last_name, :sex, :age, :phone_no, :location, :reason, :contact_person, :id_proof, :id_number, presence: true
  validates :phone_no, :id_number, uniqueness: true
  before_create :set_auto_generate_number


  def name
    "#{first_name} #{last_name}"
  end

  def set_auto_generate_number
    random_token = rand.to_s[2..8]
    unless Visitor.find_by_auto_generate_id(random_token).nil?
      set_auto_generate_number
    else
      self.auto_generate_id = random_token
    end
  end

  def as_json(options={})
    super()
  end

  def self.search(params={})
    search = params[:search]
    if search && !search.empty?
      where("first_name LIKE ? OR last_name LIKE ? OR sex LIKE ? OR age LIKE ? OR phone_no LIKE ? OR location LIKE ? OR contact_person LIKE ? OR id_number LIKE ?",
            "%#{search}%", "%#{search}%","%#{search}%", "%#{search}%","%#{search}%", "%#{search}%","%#{search}%", "%#{search}%")
    else
      all
    end
  end

end
