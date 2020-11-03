<project xmlns="com.autoesl.autopilot.project" name="ped_sub_prj" top="ped_alg">
    <files>
        <file name="../../pedsub_test.cpp" sc="0" tb="1" cflags=" -Wno-unknown-pragmas" blackbox="false" csimflags=" -Wno-unknown-pragmas"/>
        <file name="functions.cpp" sc="0" tb="false" cflags="" blackbox="false" csimflags=""/>
    </files>
    <includePaths/>
    <libraryPaths/>
    <libraryFlag/>
    <Simulation argv="">
        <SimFlow name="csim" ldflags="" mflags="" csimMode="0" lastCsimMode="0"/>
    </Simulation>
    <solutions xmlns="">
        <solution name="function_wide_latency" status="inactive"/>
        <solution name="individual_latency" status="active"/>
    </solutions>
</project>

