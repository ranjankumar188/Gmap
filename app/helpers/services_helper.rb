module ServicesHelper
HASHEs = {
  "Day" =>[
    ["Sunday","suday"],
    ["Monday","monday"], 
    ["Tuesday","tuesday"],
    ["Wednesday","wednesday"], 
    ["Thrusday","thrusday"],
    ["Friday","friday"],
    ["Saturday","saturday"]
     ],
}

  def get_hash(lov_name)
    return [["Select", "" ]]+ HASHEs[lov_name];
  end
end
