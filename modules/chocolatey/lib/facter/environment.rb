variables = [
    "systemroot",
    "systemdrive"
]

variables.each do |variable|
    Facter.add(variable) do
        confine :kernel => :windows
        setcode { ENV[variable] }
    end
end
