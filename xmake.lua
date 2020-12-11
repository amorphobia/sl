if is_plat("windows") then
    target("pdcurses")
        set_kind("static")
        add_includedirs("PDCurses")
        add_files("PDCurses/pdcurses/*.c", "PDCurses/wincon/*.c")
end

target("sl")
    set_kind("binary")
    add_files("*.c")
    if is_plat("windows") then
        add_includedirs("PDCurses")
        add_deps("pdcurses")
        add_links("User32", "Advapi32")
    else
        add_links("ncurses")
    end
