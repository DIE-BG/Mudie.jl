##Locale for Spanish (Guatemala) dates in Makie plots

import Dates

"""
    SPANISH_GT::Dates.DateLocale

Prototype of Theme with spanish locale for Makie plots and some fonts
A DateLocale for Spanish (Guatemala) with month and day names in Spanish.
"""
SPANISH_GT = Dates.DateLocale(
    ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"],
    ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"],
    ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"],
    ["Lun", "Mar", "Mie", "Jue", "Vie", "Sáb", "Dom"],
)
