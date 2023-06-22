module Health
  HEALTH_TREATMENT = {
    big_treatment: proc do |power|
      p '強治癒'
      power.include?('super health') ? 50 : 30
    end,
    mild_treatment: proc do
      p '普通治癒'
      rand < 0.9 ? 10 : 5
    end
  }

  def self.health_object
    treatment = HEALTH_TREATMENT.keys.sample
    proc { |specfic_power| HEALTH_TREATMENT[treatment].call(specfic_power) }
  end
end
