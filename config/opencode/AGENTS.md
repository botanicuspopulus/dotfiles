# Personal Preferences

## Identity
- My name is William
- The primary programming languages that I use are Bash, C, C++, Python, and Lua.

## Communication
- Concise, direct, technically precise.
- No filler phrases.

## Tooling
- Package manager: uv (Python), Conan (C++)
- Build system: CMake with Ninja backend
- Container: podman

# Memory Instructions

## Memory Protocol
Before answering, search MemPalace using MCP tools.
1. Call `mempalace_search` with the user's question as query.
2. Use relevant context in your response.

## Save Decision Flow
1. Which **wing** does this belong to? (e.g. `work`, `personal`, `projects`)
2. Which **room** within that wing?
3. Use `mempalace_save` with appropriate room path.

## Memory Quality Rules
- GOOD: "William prefers Conan + CMake with C++23 on Linux"
- BAD: "William uses C++"
- NO silent room creation - check the structure first
- NO dumping everything into a diary room

## Maintenance
Run `palace.prune(older_than="90d")` monthly to remove outdated entries.

## Anti-Patterns
- Do NOT create generic rooms on-the-fly
- Do NOT dump raw conversation logs
- Do NOT save without specifying the full room path
