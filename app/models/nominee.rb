class Nominee < ActiveRecord::Base

  INELIGIBLE_NOMINEES = %w(
                            rkh tarcieri yokolet svenfuchs fcheung drbrain
                            sutto jnicklas lsegal mhartl radar steveklabnik
                            josevalim tenderlove sandal qrush wayneeseguin fxn
                            tmm1 dkubb luislavena brynary freelancing-god jnunemaker
                            wycats ryanb rbates igrigorik evan tcopeland jeg2
                            hone skmetz mperham raggi brixen lindaliukas phenriettak ksaa
                            kytrinyx deadprogram rafaelfranca sferik enebo ahoward
                            nobu eileencodes sarahmei zzak jeremyevans samsaffron
                          )

  # Associations
  has_many :nominations

  # Validations
  validates :github_username,
              :presence => true,
              :length => { :maximum => 40 },
              :exclusion => { :in => INELIGIBLE_NOMINEES, :message => "They're already a Ruby Hero! Please nominate someone else."}

  #validates :name, :presence => true

  def self.begins_with(query)
    where(arel_table[:github_username].matches("#{query}%"))
  end

  def github_username=(username)
    self[:github_username] = username.try(:downcase)
  end

  def merge_into(nominee)
    return false if nominee == self

    transaction do
      self.nominations.each do |nomination|
        nomination.nominee = nominee
        raise ActiveRecord::Rollback unless nomination.save!
      end
      raise ActiveRecord::Rollback unless destroy
    end

    nominee
  end

  def url
    'http://github.com/%s' % github_username
  end

end
