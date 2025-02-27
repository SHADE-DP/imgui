project "ImGui"
	kind "StaticLib"
	language "C++"
	staticruntime "off"

	targetdir (outputdir)
	objdir (interdir)

	files
	{
		"imconfig.h",
		"imgui.h",
		"imgui.cpp",
		"imgui_draw.cpp",
		"imgui_internal.h",
		"imgui_tables.cpp",
		"imgui_widgets.cpp",
		"imstb_rectpack.h",
		"imstb_textedit.h",
		"imstb_truetype.h",
		"imgui_demo.cpp",
		
		"misc/cpp/**.h",
		"misc/cpp/**.cpp",
		
		"backends/imgui_impl_sdl.h",
		"backends/imgui_impl_sdl.cpp",
		"backends/imgui_impl_vulkan.h",
		"backends/imgui_impl_vulkan.cpp",

		"%{IncludeDir.imguizmo}/**.h",
		"%{IncludeDir.imguizmo}/**.cpp",
		"%{IncludeDir.imnodes}/**.h",
		"%{IncludeDir.imnodes}/**.cpp",
	}

	includedirs
	{
	  "%{prj.location}",
	  "%{IncludeDir.VULKAN}/include",
	  "%{IncludeDir.SDL}/include",
	  "%{IncludeDir.imguizmo}",
	  "%{IncludeDir.imnodes}"
	}

	excludes
	{
	  "%{IncludeDir.imguizmo}/example**.h",
	  "%{IncludeDir.imguizmo}/example**.cpp",
	  "%{IncludeDir.imguizmo}/vcpkg-example**.h",
	  "%{IncludeDir.imguizmo}/vcpkg-example**.cpp",
	}

	links
	{
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
