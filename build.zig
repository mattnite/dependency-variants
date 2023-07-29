const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});

    const dep_variant_1 = b.dependency("echo", .{
        .target = target,
        .optimize = .Debug,
    });

    const dep_variant_2 = b.dependency("echo", .{
        .target = target,
        .optimize = .ReleaseSafe,
    });

    const program_variant_1 = b.addExecutable(.{
        .name = "i_should_print_debug",
        .root_source_file = .{ .path = "src/main.zig" },
    });
    program_variant_1.linkLibrary(dep_variant_1.artifact("echo"));
    b.installArtifact(program_variant_1);

    const program_variant_2 = b.addExecutable(.{
        .name = "i_should_print_release_safe",
        .root_source_file = .{ .path = "src/main.zig" },
    });
    program_variant_2.linkLibrary(dep_variant_2.artifact("echo"));
    b.installArtifact(program_variant_2);
}
