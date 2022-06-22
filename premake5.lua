workspace "SeaShell"
	architecture "x64"
	startproject "Clam"

	configurations
	{
		"Debug",
		"Release"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

	project "Pearl"
		location "Pearl"
		kind "StaticLib"
		language "C++"
		cppdialect "C++latest"
		staticruntime "on"

		targetdir("bin/" .. outputdir .. "/%{prj.name}")
		objdir("bin-int/" .. outputdir .. "/%{prj.name}")

		files
		{
			"%{prj.name}/src/**.h",
			"%{prj.name}/src/**.cpp"
		}

		filter "system:windows"
			systemversion "latest"

		filter "configurations:Debug"
			defines "SSHELL_DEBUG"
			runtime "Debug"
			symbols "on"

		filter "configurations:Release"
			defines "SSHELL_Release"
			runtime "Release"
			optimize "on"

	project "Clam"
		location "Clam"
		kind "ConsoleApp"
		language "C++"
		cppdialect "C++latest"
		staticruntime "on"

		targetdir("bin/" .. outputdir .. "/%{prj.name}")
		objdir("bin-int/" .. outputdir .. "/%{prj.name}")

		files
		{
			"%{prj.name}/src/**.h",
			"%{prj.name}/src/**.cpp"
		}

		includedirs
		{
			"Pearl/src/include"
		}

		links
		{
			"Pearl"
		}

		filter "system:windows"
			systemversion "latest"

		filter "configurations:Debug"
			defines "SSHELL_DEBUG"
			runtime "Debug"
			symbols "on"

		filter "configurations:Release"
			defines "SSHELL_Release"
			runtime "Release"
			optimize "on"
		
