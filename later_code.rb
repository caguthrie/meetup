#format phone number
phone.to_s.split('').insert(3, "-").insert(7, "-").join()