function fenv.print
    set variables $argv

    set output ()

    for variable in $variables
        set key (echo $variable | sed 's/=.*//')
        set value (echo $variable | sed 's/[^=]*=//')

        if test "$key" = 'PATH'
          set value (echo $value | tr ':' '\n')
        end

        set -a output "set -g -x $key $value"
    end

    string join \n $output
end
