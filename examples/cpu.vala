using GTop;

public static int main (string[] args) {

    GTop.Cpu cpu;

    GTop.get_cpu (out cpu);

    stdout.printf ("CPU\n\nTotal:\t%ld\nUser:\t%ld\nNice:\t%ld\nSys:\t%ld\nIdle:\t%ld\nFreq:\t%ld\n",
                   (long)cpu.total, (long)cpu.user, (long)cpu.nice, (long)cpu.sys, (long)cpu.idle, (long)cpu.frequency);

    return 0;
}
