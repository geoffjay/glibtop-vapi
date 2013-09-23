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
namespace Top {

    /*
     * Macro utilities
     */
    [CCode (cprefix = "LIBGTOP_CHECK_VERSION")]
    public static int check_version (int major, int minor, int micro);

    /*
     * Constants
     */
    [CCode (cprefix = "GLIBTOP_", cheader_filename = "glibtop.h")]
    public const int MOUNTENTRY_LEN;

    /*
     * Class that holds results of hardware query.
     *
     * First go round doesn't include glibtop_machine, need to find out how
     * #ifdef behaves in a vapi.
     */
    [CCode (cname = "glibtop", cprefix = "glibtop_", cheader_filename = "glibtop.h", unref_function = "", free_function = "")]
    public class Results {
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
        public Results ();

        [CCode (cname = "glibtop_init_r")]
        public Results.r (ref Results server_ptr, ulong features, uint flags);

        [CCode (cname = "glibtop_init_s")]
        public Results.s (ref Results server_ptr, ulong features, uint flags);
    }

    /*
     * Class that holds results of hardware query.
     */
    [CCode (cname = "glibtop", cprefix = "glibtop_", cheader_filename = "glibtop/sysdeps.h", unref_function = "", free_function = "")]
    public class Dependencies {
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
    public static void get_sysdeps_r (Results server, out Dependencies buf);
}
