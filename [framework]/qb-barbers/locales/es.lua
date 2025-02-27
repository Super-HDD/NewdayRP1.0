local Translations = {
  error = {
      you_dont_have_enough_money = 'usted no tiene suficiente dinero!',
  },
  success = {
      you_have_purchase_new_style = '¡Has comprado un nuevo estilo!',
  },
  primary = {
      var = 'text goes here',
  },
  menu = {
      open_barber = 'Abrir barberia',
      barber_shop = 'Barberia',
  },
  commands = {
      var = 'text goes here',
  },
  progressbar = {
      var = 'text goes here',
  },
  blip = {
      barber = ' Barberia'
  },
  text = {
      height = 'Altura',
      body = 'Cuerpo',
      face = 'Cara',
      hair_beard = 'Cabello y Barba',
      hair_style = 'Estilo de cabello',
      hair_color = 'Color de cabello',
      beard_style = 'Estilo de barba',
      beard_color = 'Color de barba',
      makeup = 'Maquillaje',
      appearance = 'Apariencia',
      slim = 'Delgado',
      sporty = 'Deportivo',
      medium = 'Mediano',
      fat = 'Gordo',
      strong = 'Fuerte',
      face_width = 'Ancho de cara',
      skin_tone = 'Tono de piel',
      eyes = 'Ojos',
      eyebrows = 'Cejas',
      cheek_bones = 'Huesos de las mejillas',
      defects = 'Defectos',
      hair = 'Cabello',
      beard = 'Barba',
      eyelids = 'Párpados',
      type = "Tipo",
      visibility = 'Visibilidad',
      color_palette = 'Paleta de color ',
      color_first_rate = 'Color de primera clase',
      eyebrow = 'Ceja',
      nose_curvature = 'Curvatura de la nariz',
      nose = 'Nariz',
      up_down = 'Arriba / Abajo',
      left_right = 'Izquierda / Derecha',
      upper_lip_height = 'Altura del labio superior',
      upper_lip_width = 'Ancho del labio superior',
      upper_lip_depth = 'Profundidad del labio superior',
      lower_lip_height = 'Altura del labio inferior',
      lower_lip_width = 'Ancho del labio inferior',
      lower_lip_depth = 'Profundidad del labio inferior',
      mouth = 'Boca',
      jaw = 'Mandíbula',
      ears = 'Oidos',
      chin = 'Barbilla',
      make_up = 'Maquillaje',
      older = 'Mayor',
      type_scars = 'Tipo Cicatrices',
      type_freckles = 'Tipo pecas',
      moles = 'Lunares',
      disadvantages = 'Imperfecciones',
      spots = 'Lugares',
      shadow = 'Sombra',
      color_shadow = 'Color de Sombra',
      color_first_class_delusion = 'Color de delirio de primera clase',
      blushing_cheek = 'Mejilla sonrojada',
      cheek_blush_color = 'Rubor de mejillas',
      color_first_degree_cheek_redness = 'Color Enrojecimiento de las mejillas de primer grado',
      type_lipstick = 'Tipo de lápiz labial',
      color_lipstick = 'Color de lápiz labial',
      first_class_color_ipstick = 'Color de lápiz labial de primera clase',
      second_color_lipstick = 'Segundo color de lápiz labial',
      eyeliners = 'Delineadores de ojos',
      color_eyeliners = 'Color de delineadores de ojos',
      color_main_eyeliners = 'Color principal de delineadores de ojos',
      save = 'Guardar',
      options = 'Opciones',
      top_right = 'arriba-derecha',
      style = 'Estilo ',
      color = 'Color ',
      size = 'Talla',
      width = 'Ancho ',
      depth = 'Profundidad',
      waist = 'Cintura',
      distance = 'Distancia',
      angle = 'Angulo',
      clarity = 'Claridad',
  }
}

if GetConvar('QB_locale', 'en') == 'es' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
