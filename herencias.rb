class Appointment
    attr_reader :location, :purpose, :hour, :min
    def initialize(location,purpose,hour,min)
        @location = location
        @purpose = purpose
        @hour = hour
        @min = min
    end
end

class MonthlyAppointment < Appointment
    attr_reader :day
    def initialize(location,purpose,hour,min,day)
        super(location,purpose,hour,min)
        @day = day
    end

    def occurs_on?(day)
        @day == day
    end

    def to_s
        "Reunión mensual en #{@location} sobre #{@purpose} el día #{@day} a la(s) #{@hour}:#{@min}.."
    end
end

class DailyAppointment < Appointment
    def to_s
        "Reunión diaria en #{@location} sobre #{@purpose} a las #{@hour}:#{@min}"
    end

    def occurs_on?(hour,min)
         @hour == hour && @min == min
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
        "Reunión única en #{@location} sobre #{@purpose} el #{@day}/#{@month}/#{@year} a las #{@hour}:#{@min}"
    end

    def occurs_on?(day,month,year)
        @day == day && @month == month && @year == year
   end
end

a = OneTimeAppointment.new('Desafío Latam', 'Trabajo', 14, 30, 4, 6, 2019)
# Reunión única en Desafío Latam sobre Trabajo el 4/6/2019 a la(s) 14:30
b = DailyAppointment.new('Desafío Latam', 'Educación', 8, 15)
# Reunión diaria en Desafío Latam sobre Educación a la(s) 8:15
c = MonthlyAppointment.new('NASA', 'Aliens', 8, 15, 23)
# Reunión mensual en NASA sobre Aliens el día 23 a la(s) 8:15

pp a.occurs_on?(8,15,6)