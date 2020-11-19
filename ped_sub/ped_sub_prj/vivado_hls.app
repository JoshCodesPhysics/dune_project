<project xmlns="com.autoesl.autopilot.project" name="ped_sub_prj" top="ped_alg">
    <includePaths/>
    <libraryPaths/>
    <libraryFlag/>
    <Simulation argv="">
        <SimFlow name="csim" ldflags="" mflags="" csimMode="0" lastCsimMode="0"/>
    </Simulation>
    <files xmlns="">
        <file name="../../pedsub_test2.cpp" sc="0" tb="1" cflags=" -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="functions.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="functions.h" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
    </files>
    <solutions xmlns="">
        <solution name="function_wide_latency" status="inactive"/>
        <solution name="individual_latency" status="inactive"/>
        <solution name="new_testbench" status="inactive"/>
        <solution name="tready_treset_solution" status="inactive"/>
        <solution name="state_save_restore" status="active"/>
    </solutions>
</project>

