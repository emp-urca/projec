\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{PPGSOF}[2026/01/29 Classe personalizada]

\LoadClass[12pt,a4paper,oneside]{report}

% Pacotes básicos
%---------------------------------------------------------------------------
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{tikz}
\RequirePackage[portuguese]{babel}
\RequirePackage{csvsimple-l3}
\RequirePackage{tabularx}
\RequirePackage{graphicx}
%---------------------------------------------------------------------------
% configura o cabeçalho e o rodapé da página 

% cabeçalho

% --- Pacotes necessários no preâmbulo ---
% \usepackage{fancyhdr}
% \usepackage{tikz}
% \usepackage{graphicx}

% Configuração das dimensões
\setlength{\headheight}{95pt} 
\pagestyle{fancy}
\fancyhf{} % Limpa cabeçalho e rodapé

\newcommand{\fancyheadppgsof}{%
    \begin{tikzpicture}[remember picture, overlay]
        % Grupo Central: Identificação
        \node[anchor=north] at ([yshift=-0.5cm]current page.north) (texto) {
            \begin{tabular}{c}
                \fontsize{10}{12}\selectfont \textbf{Ministério da Educação} \\
                \fontsize{10}{12}\selectfont \textbf{Universidade Federal de Roraima} \\
                \fontsize{10}{12}\selectfont \textbf{Pró-Reitoria de Pesquisa e Pós-Graduação} \\
                \fontsize{11}{13}\selectfont \textbf{Programa de Pós-Graduação em Sociedade e Fronteiras}
            \end{tabular}
        };

        % Brasão da República (Esquerda)
        \node[anchor=east] at ([xshift=-1cm]texto.west) {
            \includegraphics[width=2.2cm]{figuras/brasao_br.png}
        };

        % Logo UFRR (Direita)
        \node[anchor=west] at ([xshift=1cm]texto.east) {
            \includegraphics[width=2.8cm]{figuras/brasao_ufrr.png}
        };

        % Rodapé da Página (Opcional: se quiser fixo no final da página)
        \node[anchor=south west, align=left] at ([shift={(1cm, 0.5cm)}]current page.south west) {
            \fontsize{9}{11}\selectfont
            Edital nº 007/\the\year\ -- PPGSOF  \\
            \fontsize{9}{11}\selectfont
            Publicado em \today.
        };
    \end{tikzpicture}
}

%---------------------------------------------------------------------------

% Configura as Margens do arquivo
\geometry{%
  left = 1cm,
  right = 1cm,
  top = 3.5cm,
  bottom = 1cm
}%

% Comando:
\newcommand{\celula}[3]{%
    \csvreader[
        separator=comma,    % Garante o uso da vírgula aqui
        range=#3-#3,        % Filtra a linha
        late after line=    % Remove quebras de linha automáticas
    ]{#1}{#2=\valor}{\valor}%
}


% No preâmbulo do seu documento:
\newcommand{\assinaturaTres}[3]{
    \vspace{2cm}
    \begin{center}
        % Presidente (Topo)
        \begin{minipage}{0.5\textwidth}
            \centering
            #1 \\ Presidente
        \end{minipage}

        \vspace{1.5cm} % Espaço entre o presidente e os membros

        % Membro 1 (Esquerda)
        \begin{minipage}{0.45\textwidth}
            \centering
            #2 \\ Membro
        \end{minipage}
        \hfill % Empurra o segundo membro para a direita
        % Membro 2 (Direita)
        \begin{minipage}{0.45\textwidth}
            \centering
            #3 \\ Membro
        \end{minipage}
    \end{center}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%---------------------------------------------------------------------------
% Comando para o Cabeçalho (Número e Data)
\newcommand{\cabecalhoEdital}[1]{
    \noindent
    \begin{tabularx}{\textwidth}{@{} X r @{}}
        \textbf{Edital nº #1/\the\year\ - PPGSOF} & Boa Vista, Brasil. \today.
    \end{tabularx}
}

% Comando para a Ementa (Texto recuado à direita)
\newcommand{\ementa}[1]{
    \noindent\hfill
    \begin{minipage}{0.45\textwidth} % Ajuste a largura conforme necessário
     #1
    \end{minipage}
    \vspace{0.5cm}
}
