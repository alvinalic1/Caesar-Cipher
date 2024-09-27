
def ceasar_cipher(string, shift_factor)
  ascii_values = string.codepoints
  new_ascii_values = []

  upper_case_a = 65
  upper_case_z = 90

  lower_case_a = 97
  lower_case_z = 122

  ascii_values.each do |ascii|
    if((ascii >= upper_case_a && ascii <= upper_case_z) && ascii + shift_factor > upper_case_z)
      new_value = wrap_uppercase(ascii, upper_case_z, shift_factor)
      new_ascii_values.push(new_value)
      next
    elsif((ascii >= lower_case_a && ascii <= lower_case_z ) && ascii + shift_factor > lower_case_z)
      new_value = wrap_lowercase(ascii, lower_case_z, shift_factor)
      new_ascii_values.push(new_value)
      next
    end
   

    if (ascii >= upper_case_a && ascii <= upper_case_z) || (ascii >= lower_case_a && ascii <= lower_case_z )
      new_ascii_values.push(ascii + shift_factor)
     else
      new_ascii_values.push(ascii)
    end
  end
  
  s = ascii_values.map{|value| value.chr}
  puts s.to_s
  
  puts "NEW"
  new_string = new_ascii_values.map{|value| value.chr}
  puts new_string.to_s

end


def wrap_uppercase(ascii, z_uppercase, shift_factor)
  amount_shifted = z_uppercase - ascii
  left_to_shift = shift_factor - amount_shifted
  new_value = 65 + left_to_shift - 1
end

def wrap_lowercase(ascii, z_lowercase, shift_factor)
  amount_shifted = z_lowercase - ascii
  left_to_shift = shift_factor - amount_shifted
  new_value = 97 + left_to_shift - 1
end


ceasar_cipher("Bmfy f xywnsl!", 21)