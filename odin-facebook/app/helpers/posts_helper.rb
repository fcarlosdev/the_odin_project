module PostsHelper

  def get_professions
    professions = {
      "Arts and entertainment":
         ["Accessory designer", "Advertising designer","Animator",
          "Art administrator", "Publicist", "Scenic artist", "Stage Manager",
          "Technical Director", "Dancer", "Cartoonist", "Casting director",
          "Director"],
      "Business": ["Chief compliance officer", "Chief creative officer",
          "Chief content officer","Chief customer officer","Chief data officer",
          "Chief financial officer"],
      "Industrial and manufacturing": ["Auto mechanic", "Beader", "Bobbin boy",
        "Clerk of the Chapel", "Filling station attendant", "Foreman",
        "Maintenance engineering", "Mechanic"],
      "Law Enforcement and Armed Forces": ["Accountant General", "Adjudicator",
        "Advocate", "Advocate General", "Advocatus", "Arbitrator",
        "Attorney at foreign law", "Attorney general",
        "Attorney General to the Prince of Wales", "Chief Defense Counsel",
        "Police", "Police prosecutor", "Politician", "Judge"],
      "Science and technology": ["Computer operator", "Computer repair technician",
        "Computer scientist", "Computer analyst", "Data analyst", "Data scientist",
        "Network administrator", "Programmer", "Software analyst", "Software design",
        "Software engineer", "Web developer", "Engineer", "Engineering technician",
        "Engineering technologist", "Chemical engineer", "Aeronautical engineer",
        "Psychologist", "Biologist", "Biomolecular engineering",
        "Molecular engineering"],
      "Healthcare and medicine": ["Anesthesiology", "Cardiovascular medicine",
       	"Chiropractor", "Critical care medicine", "Dermatology", "Emergency medicine",
       	"Endocrinology", "Geriatric medicine", "Gastroenterology", "Haematology",
       	"Nephrology", "Neurology", "Oncology", "Ophthalmology and Optometry",
       	"Otorhinolaryngology", "Pastoral care", "Pulmonology (Respirology)",
       	"Primary care medicine", "Pediatric medicine"],
      "Service": ["Taxicab driver", "Uber Driver", "Chauffeur", "Pay driver",
         "Test driver", "Delivery (commerce)", "Bus driver", "Truck driver",
         "Motorman"]
    }

  end

  def get_education
    [["Some High School", "Some High School"],
     ["High School Graduate", "High School Graduate"],
     ["Some College", "Some College"],
     ["Bachelor's Degree", "Bachelor's Degree"],
     ["Post Graduate Degree", "Post Graduate Degree"]]
  end

end
