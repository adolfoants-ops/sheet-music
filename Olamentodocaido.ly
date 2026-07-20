\v\version "2.24.0"

\header {
  title = "O Lamento do Caído"
  subtitle = "Solo Fingerstyle e Voz para Decacorde (10 Cordas)"
  composer = "Arranjo em Ré Menor"
  poet = "Versos Decassílabos"
}

% --- Configuração da Tablatura do Decacorde (10 Cordas em Ré Menor) ---
decacordeTuning = \stringTuning <d,, f,, a,, c, d, f, a, d f a>

% --- Melodia da Voz e Cifra ---
melody = \relative c' {
  \clef treble
  \key d \minor
  \time 4/4
  \tempo "Lento e Rubato" 4 = 65

  % Verso 1
  a'4 a a b8( a) | g4 g g a8( g) | f4 f f8( g) f( e) | e1 \bar "||"
  
  % Verso 2
  a4 a a b8( a) | g4 g g a8( g) | f4 f e8( f) e( d) | d1 \bar "|."
}

verseOne = \lyricmode {
  Ao ver a cruz er -- guer- -- se con -- tra o céu,
  Cum -- pri -- da a far -- sa da mi -- nha ra -- zão,
  Sen -- ti ras -- gar- -- se o meu an -- ti -- go véu,
  Dor -- miu a tre -- va em mi -- nha pró -- pria mão.
}

% --- Solo Fingerstyle no Decacorde (Notação de Violão/Bandolim) ---
fingerstyle = \relative c {
  \clef "treble_8"
  \key d \minor
  \time 4/4

  % Introdução e Acompanhamento
  << 
    { <f' a>4 <f a> <f a> <g b>8 <f a> | <e g>4 <e g> <e g> <f a>8 <e g> | <d f>4 <d f> <d f>8 <e g> <d f> <cis e> | <cis e>1 } \\
    { d,,2 d | a, a | d, a, | d,1 }
  >>
  
  << 
    { <f' a>4 <f a> <f a> <g b>8 <f a> | <e g>4 <e g> <e g> <f a>8 <e g> | <d f>4 <d f> <cis e>8 <d f> <cis e> <d f> | <d f>1 } \\
    { f,,2 f,, | a,, a,, | d,, a,, | d,,1 }
  >>
}

% --- Montagem da Partitura Completa ---
\score {
  <<
    % Linha de Cifras
    \new ChordNames {
      \chordmode {
        d2:m d:m | a2:m a:m | d2:m a2:7 | a1:7 |
        d2:m f2  | a2:m a2:m | d2:m a2:7 | d1:m |
      }
    }

    % Linha da Voz com Letra
    \new Staff \with { instrumentName = "Voz" } {
      \new Voice = "melodia" { \melody }
    }
    \new Lyrics \lyricsto "melodia" \verseOne

    % Partitura e Tablatura do Decacorde
    \new StaffGroup \with { instrumentName = "Decacorde" } <<
      \new Staff { \fingerstyle }
      \new TabStaff \with { stringTunings = \decacordeTuning } {
        \fingerstyle
      }
    >>
  >>

  \layout {
    \context {
      \Staff
      \override TimeSignature.style = #'numbered
    }
  }
  \midi { }
}ersion "2.24.0"
