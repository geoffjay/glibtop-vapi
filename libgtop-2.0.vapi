/*
 * glibtop.vapi
 * Vala bindings for the glibtop library.
 * Copyright (c) 2013 Geoff Johnson <geoff.jay@gmail.com>
 * License: GNU LGPL v2 as published by the Free Software Foundation
 *
 * This binding is a (mostly) strict binding to the function-oriented
 * nature of this C library.
 */

[CCode (cprefix = "glibtop_", cheader_filename = "glibtop.h")]
namespace GTop {

    /*
     * Macro utilities
     */
    [CCode (cprefix = "LIBGTOP_CHECK_VERSION")]
    public static int check_version (int major, int minor, int micro);

    /*
     * Constants
     */
    [CCode (cprefix = "LIBGTOP_", cheader_filename = "libgtopconfig.h")]
    public const int MAJOR_VERSION;
    [CCode (cprefix = "LIBGTOP_", cheader_filename = "libgtopconfig.h")]
    public const int MINOR_VERSION;
    [CCode (cprefix = "LIBGTOP_", cheader_filename = "libgtopconfig.h")]
    public const int MICRO_VERSION;

    [CCode (cprefix = "GLIBTOP_", cheader_filename = "glibtop.h")]
    public const int MOUNTENTRY_LEN;

    /*
     * CPU flags
     */
    [CCode (cprefix = "GLIBTOP_CPU_", cheader_filename = "glibtop/cpu.h")]
    public enum CpuFlags {
        TOTAL,
        USER,
        NICE,
        SYS,
        IDLE,
        FREQUENCY,
        IOWAIT,
        IRQ,
        SOFTIRQ
    }

    [CCode (cprefix = "GLIBTOP_XCPU_", cheader_filename = "glibtop/cpu.h")]
    public enum XCpuFlags {
        TOTAL,
        USER,
        NICE,
        SYS,
        IDLE,
        FREQUENCY,
        IOWAIT,
        IRQ,
        SOFTIRQ
    }

    [CCode (cprefix = "GLIBTOP_", cheader_filename = "glibtop/cpu.h")]
    public const int MAX_CPU;
    [CCode (cprefix = "GLIBTOP_", cheader_filename = "glibtop/cpu.h")]
    public const int NCPU;

    /*
     * Class that holds results of hardware query.
     *
     * First go round doesn't include glibtop_machine, need to find out how
     * #ifdef behaves in a vapi.
     */
    [CCode (cname = "glibtop", cprefix = "glibtop_", cheader_filename = "glibtop.h", unref_function = "", free_function = "glibtop_close")]
    public class Context {

        public uint flags;
        public uint method;
        public uint error_method;
        //public Machine machine;
        public int input[2];
        public int output[2];
        public int socket;
        public int ncpu;
        public int real_ncpu;
        public ulong os_version_code;
        public string name;
        public string server_command;
        public string server_host;
        public string server_user;
        public string server_rsh;
        public ulong features;
        public ulong server_port;
        public Dependencies sysdeps;
        public Dependencies required;
        public Posix.pid_t pid;

        [CCode (cname = "glibtop_init")]
        public Context ();

        [CCode (cname = "glibtop_init_r")]
        public Context.r ([CCode (cname = "server_ptr")] out unowned Context server, ulong features, uint flags);

        [CCode (cname = "glibtop_init_s")]
        public Context.s ([CCode (cname = "server_ptr")] out unowned Context server, ulong features, uint flags);

        /*
         * I'm not sure if this makes sense, but possibly closing the Context
         * while providing the server reference is independent of destruction.
         */

        [CCode (cheader_filename = "glibtop/close.h")]
        public void close_r ();

        [CCode (cheader_filename = "glibtop/close.h")]
        public void close_s ();

        [CCode (cheader_filename = "glibtop/close.h")]
        public void close_p ();
    }

    /*
     * Class containing a list of features.
     */
    [CCode (cname = "glibtop_sysdeps", cheader_filename = "glibtop/sysdeps.h", destroy_function = "")]
    public struct Dependencies {

        public uint64 flags;
        public uint64 features;
        public uint64 cpu;
        public uint64 mem;
        public uint64 swap;
        public uint64 uptime;
        public uint64 loadavg;
        public uint64 shm_limits;
        public uint64 msg_limits;
        public uint64 sem_limits;
        public uint64 proclist;
        public uint64 proc_state;
        public uint64 proc_uid;
        public uint64 proc_mem;
        public uint64 proc_time;
        public uint64 proc_signal;
        public uint64 proc_kernel;
        public uint64 proc_segment;
        public uint64 proc_args;
        public uint64 proc_map;
        public uint64 proc_open_files;
        public uint64 mountlist;
        public uint64 fsusage;
        public uint64 netlist;
        public uint64 netload;
        public uint64 ppp;
        public uint64 proc_wd;
        public uint64 proc_affinity;
    }

    /*
     * Static utility functions
     */
    public static void get_sysdeps (out Dependencies buf);
    public static void get_sysdeps_r (Context server, out Dependencies buf);
}
