import gtk2, gtksourceview
type

  TSettings* = object
  
    search*: string
    
    font*: string # font used by the sourceview
    colorSchemeID*: string # color scheme used by the sourceview
    indentWidth*: int # how many spaces used for indenting code(in the sourceview)
    showLineNumbers*: bool # whether to show line numbers in the sourceview
    highlightMatchingBrackets*: bool # whether to highlight matching brackets
    rightMargin*: bool # Whether to show the right margin
    highlightCurrentLine*: bool # Whether to highlight the current line
    autoIndent*: bool    

    winMaximized*: bool # Whether the MainWindow is maximized on startup
    VPanedPos*: int # Position of the VPaned, which splits
                    # the sourceViewTabs and bottomPanelTabs
    winWidth*, winHeight*: int # The size of the window.
                    
    bottomPanelVisible*: bool # Whether the bottom panel is shown
    

  MainWin* = object
    # Widgets
    w*: gtk2.PWindow
    langMan*: PSourceLanguageManager
    nimLang*: PSourceLanguage
    scheme*: PSourceStyleScheme # color scheme the sourceview is meant to use
    SourceViewTabs*: PNotebook # Tabs which hold the sourceView
    bottomBar*: PStatusBar 
    
    bottomPanelTabs*: PNotebook
    outputTextView*: PTextView
    
    findBar*: PHBox # findBar
    findEntry*: PEntry
    replaceEntry*: PEntry
    replaceLabel*: PLabel
    replaceBtn*: PButton
    replaceAllBtn*: PButton
    
    viewBottomPanelMenuItem*: PMenuItem # view menu

    Tabs*: seq[Tab] # Other
    
    settings*: TSettings

  Tab* = object
    buffer*: PSourceBuffer
    sourceView*: PWidget
    label*: PLabel
    saved*: bool
    filename*: string