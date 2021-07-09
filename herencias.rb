class Appointment
    attr_reader :location, :purpose, :hour, :min

    def initialize(location,purpose,hour,min)
        get_location_purpose(location,purpose)
        get_hour_min(hour,min)
    end

    def get_location_purpose(location,purpose)
        if location.class == String && purpose.class == String
            @location = location
            @purpose = purpose
        else
            raise "Pásate un string"
        end
    end

    
    def get_hour_min(hour,min)
        if hour.class == Integer && min.class == Integer
            @hour = hour
            @min = min
        else
            raise "Pásate un número"
        end
    end

end

class MonthlyAppointment < Appointment
    attr_reader :day

    def initialize(location,purpose,hour,min,day)
        super(location,purpose,hour,min)
        @day = day
    end

    def occurs_on?(day)
        self.day == day
    end

    def to_s
        "Reunión mensual en #{self.location} sobre #{self.purpose} el día #{self.day} a la(s) #{self.hour}:#{self.min}."
    end

end

class DailyAppointment < Appointment

    def to_s
        "Reunión diaria en #{self.location} sobre #{self.purpose} a las #{self.hour}:#{self.min}"
    end

    def occurs_on?(hour,min)
         self.hour == hour && self.min == min
    end

end

class OneTimeAppointment < Appointment
    attr_reader :day, :month, :year

    def initialize(location,purpose,hour,min,day,month,year)
        super(location,purpose,hour,min)
        @day = day
        @month = month
        @year = year
    end

    def to_s
        "Reunión única en #{self.location} sobre #{self.purpose} el #{self.day}/#{self.month}/#{self.year} a las #{self.hour}:#{self.min}"
    end

    def occurs_on?(day,month,year)
        self.day == day && self.month == month && self.year == year
    end

end

a = OneTimeAppointment.new('Desafío Latam', 'Trabajo', 14, 30, 4, 6, 2019)
# Reunión única en Desafío Latam sobre Trabajo el 4/6/2019 a la(s) 14:30
b = DailyAppointment.new('Desafío Latam', 'Educación', 8, 15)
# Reunión diaria en Desafío Latam sobre Educación a la(s) 8:15
c = MonthlyAppointment.new('NASA', 'Aliens', 8, 15, 23)
# Reunión mensual en NASA sobre Aliens el día 23 a la(s) 8:15

puts c
