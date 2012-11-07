function anim = animation_plotData(anim)
    n = size(anim.adjacency_matrix,1);
    m = nnz(anim.adjacency_matrix);

    plot(anim.data(:,1), anim.data(:,2), '.k');

    [i,j] = find(anim.adjacency_matrix);
    for l = 1 : m
        if j(l) < i(l) % symmatrix, lower triangle only
            node1 = [anim.data(j(l),1) anim.data(i(l),1)]';
            node2 = [anim.data(j(l),2) anim.data(i(l),2)]';
            plot(node1, node2, 'Color', 'black');
        end
    end